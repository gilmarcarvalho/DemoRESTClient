unit ufMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, REST.Response.Adapter,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls,
  rest.json,system.json,  Vcl.ExtCtrls,System.JSON.Readers,   System.JSON.Types,
  System.Generics.Collections,  Vcl.ValEdit,TypInfo, Vcl.ComCtrls,
  Vcl.Imaging.pngimage,IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient;

type
  TfMain = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    FDMemTable1id: TIntegerField;
    FDMemTable1title: TStringField;
    FDMemTable1body: TStringField;
    FDMemTable1userId: TIntegerField;
    FDMemTable2: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTable2postId: TIntegerField;
    FDMemTable2id: TIntegerField;
    FDMemTable2name: TStringField;
    FDMemTable2email: TStringField;
    FDMemTable2body: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    FDMemTable3: TFDMemTable;
    DataSource3: TDataSource;
    FDMemTable3albumId: TIntegerField;
    FDMemTable3id: TIntegerField;
    FDMemTable3title: TStringField;
    FDMemTable3url: TStringField;
    FDMemTable3thumbnailUrl: TStringField;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Panel2: TPanel;
    Image1: TImage;
    IdHTTP1: TIdHTTP;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure FDMemTable3AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    Opening:boolean;
    const URLBase='https://jsonplaceholder.typicode.com';
    procedure loadPosts(aDataset:TDataset);
    procedure loadComments(aDataset:TDataset);
    procedure loadPhotos(aDataset:TDataset);
    procedure GetImageByUrl(URL: string; APicture:TPicture);
    function getJson(aURL:string):string;

  public

    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure tfMain.GetImageByUrl(URL: string; APicture:TPicture);
var
  Png: TPNGImage;
  Strm: TMemoryStream;
  Picture:TPicture;
begin
  if Opening then
    exit;
  Picture:=tpicture.Create;
  Screen.Cursor := crHourGlass;
  Png := TPNGImage.Create;
  Strm := TMemoryStream.Create;

  try
    IdHTTP1.Get(URL, Strm);
    if (Strm.Size > 0) then
    begin
      Strm.Position := 0;
      Png.LoadFromStream(Strm);
      APicture.Assign(PNG);
    end;
  finally
    Strm.Free;
    Png.Free;
    Picture.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfMain.FDMemTable1AfterScroll(DataSet: TDataSet);
begin
  loadComments(fdmemtable2);
end;

procedure TfMain.FDMemTable3AfterScroll(DataSet: TDataSet);
begin
  GetImageByUrl(DataSet.FieldByName('thumbnailUrl').AsString,Image1.Picture);
end;

function tfmain.getJson(aURL:string):string;
begin
  screen.Cursor:=crHourglass;
  RESTClient1.BaseURL:=aURL;
  RESTRequest1.Execute;
  result:= RESTResponse1.Content;
  screen.Cursor:=crDefault;
end;

procedure tfmain.LoadPosts(aDataset: TDataSet);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  Opening:=true;
  aJSON:=getJson(URLBase+'/posts');
  aDataset.Active:=false;
  aDataset.Active:=true;
  JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  for I := 0 to JA.Count-1 do
  begin
    JO:=(ja.Items[I] as TJSONObject);
    aDataset.Append;
    for j := 0 to jo.Count-1 do
    begin
      JP:=JO.Pairs[j];
      aDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
    end;
    aDataset.Post;
  end;
  aDataset.Open;
  ja.Free;
  Opening:=false;
end;

procedure tfmain.LoadComments(aDataset: TDataSet);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  if Opening then
    exit;
  aJSON:=getJson(URLBase+'/comments?postId='+fdmemtable1.FieldByName('id').AsString);
  aDataset.Active:=false;
  aDataset.Active:=true;
  JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  for I := 0 to JA.Count-1 do
  begin
    JO:=(ja.Items[I] as TJSONObject);
    aDataset.Append;
    for j := 0 to jo.Count-1 do
    begin
      JP:=JO.Pairs[j];
      aDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
    end;
    aDataset.Post;
  end;
  aDataset.Open;
  ja.Free;
end;

procedure tfmain.LoadPhotos(aDataset: TDataSet);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  Opening:=true;
  aJSON:=getJson(URLBase+'/photos?albumId=1');
  aDataset.Active:=false;
  aDataset.Active:=true;
  JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  for I := 0 to JA.Count-1 do
  begin
    JO:=(ja.Items[I] as TJSONObject);
    aDataset.Append;
    for j := 0 to jo.Count-1 do
    begin
      JP:=JO.pairs[j];
      aDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
    end;
    aDataset.Post;
  end;
  aDataset.Open;
  ja.Free;
  Opening:=false;
end;

procedure TfMain.Button1Click(Sender: TObject);
begin
  LoadPosts(FDMemTable1);
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  LoadPhotos(FDMemTable3);
end;

end.

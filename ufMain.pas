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
  Vcl.ValEdit,TypInfo;

type
  TfMain = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    FDMemTable1id: TIntegerField;
    FDMemTable1title: TStringField;
    FDMemTable1body: TStringField;
    FDMemTable1userId: TIntegerField;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    FDMemTable2: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTable2postId: TIntegerField;
    FDMemTable2id: TIntegerField;
    FDMemTable2name: TStringField;
    FDMemTable2email: TStringField;
    FDMemTable2body: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    OpeningPosts:boolean;
    const URLBase='https://jsonplaceholder.typicode.com';
    procedure loadPosts(aDataset:TDataset);
    procedure loadComments(aDataset:TDataset);
    function getJson(aURL:string):string;

  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}
procedure TfMain.FDMemTable1AfterScroll(DataSet: TDataSet);
begin
  loadComments(fdmemtable2);
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
  OpeningPosts:=true;
  aJSON:=getJson(URLBase+'/posts');
  aDataset.Active:=false;
  aDataset.Active:=true;
  JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  for I := 0 to JA.Size-1 do
  begin
    JO:=(ja.Get(I) as TJSONObject);
    aDataset.Append;
    for j := 0 to jo.Size-1 do
    begin
      JP:=JO.Get(j);
      aDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
    end;
    aDataset.Post;
  end;
  aDataset.Open;
  ja.Free;
  OpeningPosts:=false;
end;

procedure tfmain.LoadComments(aDataset: TDataSet);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  if OpeningPosts then
    exit;
  aJSON:=getJson(URLBase+'/comments?postId='+fdmemtable1.FieldByName('id').AsString);
  aDataset.Active:=false;
  aDataset.Active:=true;
  JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  for I := 0 to JA.Size-1 do
  begin
    JO:=(ja.Get(I) as TJSONObject);
    aDataset.Append;
    for j := 0 to jo.Size-1 do
    begin
      JP:=JO.Get(j);
      aDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
    end;
    aDataset.Post;
  end;
  aDataset.Open;
  ja.Free;
end;


procedure TfMain.Button1Click(Sender: TObject);
 var
  strJSON:string;
  I: Integer;
  f: tField;
  s:string;
begin
  LoadPosts(FDMemTable1);
end;



end.

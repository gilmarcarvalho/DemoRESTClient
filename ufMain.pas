unit ufMain;

{*******************************************************************************
    Project link   : https://github.com/gilmarcarvalho/DemoRESTClient
    Created In     : 2019-09-02 14:38:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}


interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms,  Data.DB,
FireDAC.Stan.Intf,   FireDAC.Stan.Option, FireDAC.Stan.Param,
FireDAC.Stan.Error, FireDAC.DatS,  FireDAC.Phys.Intf, FireDAC.DApt.Intf,
 FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
 Vcl.DBGrids,  Data.Bind.Components, Data.Bind.ObjectScope,
 Vcl.StdCtrls,  Vcl.ExtCtrls,  Vcl.ValEdit, Vcl.ComCtrls,WSClient;

type
  TfMain = class(TForm)
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
    Label2: TLabel;
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
    procedure FDMemTable3AfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    baseURL:string;
    WSClient:TWSClient;

  public

    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}


procedure TfMain.Button1Click(Sender: TObject);
begin
  wsclient.JsonToDataset(baseURL+'/posts',fdmemtable1);
end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  wsclient.JsonToDataset(baseURL+'/photos/?albumId=10',fdmemtable3);
end;

procedure TfMain.FDMemTable1AfterScroll(DataSet: TDataSet);
begin
  wsclient.JsonToDataset(baseURL+'/comments/?postId='+dataset.FieldByName('id').AsString,FDMemTable2);
end;
procedure TfMain.FDMemTable3AfterScroll(DataSet: TDataSet);
var img:tpicture;
begin
  img:=wsclient.GetImageByUrl(fdmemtable3.FieldByName('thumbnailUrl').AsString);
  image1.Picture.Assign(img);
  img.Free;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  wsclient.Free;
end;

procedure TfMain.FormShow(Sender: TObject);
begin
  WSClient:=tWSClient.create;
  baseurl:='https://jsonplaceholder.typicode.com';
end;


end.

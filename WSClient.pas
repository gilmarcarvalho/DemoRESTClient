unit WSClient;

{*******************************************************************************
    Project link   : https://github.com/gilmarcarvalho/DemoRESTClient
    Created In     : 2019-09-02 14:38:10
    Created By     : Gilmar Alves de Carvalho - (linkedin.com/in/gilmar-carvalho)
*******************************************************************************}

interface

uses
vcl.controls, Generics.Collections, Rest.Json, System.JSON,Data.DB,REST.Client,
SysUtils,vcl.Graphics,system.classes,IdHTTP, IdBaseComponent, IdComponent,
IdTCPConnection,  IdTCPClient, Vcl.Imaging.pngimage,Vcl.Imaging.jpeg;

type
TJsonResult = class
  private
    _StatusCode:integer;
    _Content:string;
    _RESTClient: TRESTClient;
    _RESTRequest: TRESTRequest;
    _RESTResponse: TRESTResponse;
  public
    property StatusCode:integer read _StatusCode;
    property Content:String read _Content;
    procedure Execute(aURL:String);
    constructor Create;
    destructor Destroy;override;
end;

type

TWSClient = class
  private
    _idHTTP:tIdHTTP;
    _JsonResult: TJSONResult;
  public
    Procedure JsonToDataset(URL:string;toDataset:TDataset);
    function GetImageByUrl(URL: string ):TPicture;
    Constructor Create;
    destructor Destroy; override;
end;

implementation

{TJsonResult}

Constructor TJsonResult.Create;
begin
  _RESTClient:=TRESTClient.Create('');
  _RestRequest:=TRestRequest.Create(nil);
  _RESTResponse:=TRESTResponse.Create(nil);
  _RestRequest.Client:=_RESTClient;
  _RestRequest.Response:=_RESTResponse;
  _RESTClient.Accept:='application/json';
  _RestClient.AcceptCharset:='utf-8, *;q=0.8';
end;

Destructor TJsonResult.destroy;
begin
  _RESTClient.Free;
  _RestRequest.Free;
  _RESTResponse.Free;
end;

Procedure TJsonResult.Execute(aURL:string);
begin
  _RESTClient.BaseURL:=aURL;
  _RESTRequest.Execute;
  _StatusCode:=_RESTResponse.StatusCode;
  _Content:=_RESTResponse.Content;
end;

{TWSClient}

constructor TWSClient.Create;
begin
   _JsonResult:=TJSonResult.Create;
  _idHTTP:=tidHttp.Create(nil);
end;

Destructor TWSClient.Destroy;
begin
  _JsonResult.Free;
  _idHTTP.free;
end;


procedure TWSClient.JsonToDataset(URL:string;toDataset:TDataset);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  _JsonResult.Execute(url);
  if (_JsonResult.StatusCode=200)and(_JSonResult.Content <> '') then
  begin
    aJSON:=_JsonResult.Content;
    toDataset.Active:=false;
    toDataset.Active:=true;
    JA:=TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
    for I := 0 to JA.Count-1 do
    begin
      JO:=(ja.Items[I] as TJSONObject);
      toDataset.Append;
      for j := 0 to jo.Count-1 do
      begin
        JP:=JO.Pairs[j];
        toDataset.FieldByName(jp.JsonString.Value).Value:=jp.JsonValue.Value;
      end;
      toDataset.Post;
    end;
    toDataset.Open;
    ja.Free;
  end else
  begin
    raise exception.Create('Dados não encontrados em '+url);
  end;

end;

function TWSClient.GetImageByUrl(URL: string):TPicture;
var
  Strm: TMemoryStream;
  Picture:TPicture;
begin
  Picture:=tpicture.Create;
  result:= Picture;
  Strm := TMemoryStream.Create;
  try
    _idHTTP.Get(URL, Strm);
    if (Strm.Size > 0) then
    begin
      Strm.Position := 0;
      Picture.LoadFromStream(Strm) ;
      result:= Picture;
    end;
  finally
    Strm.Free;
  end;
end;



end.

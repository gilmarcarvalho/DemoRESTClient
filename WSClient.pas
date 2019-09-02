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

TWSClient = class
private
  _processing:boolean;
  _idHTTP:tIdHTTP;
  _RESTClient: TRESTClient;
  _RESTRequest: TRESTRequest;
  _RESTResponse: TRESTResponse;
  function getJson(aURL:String):string;
public
  Procedure JsonToDataset(URL:string;toDataset:TDataset);
  function GetImageByUrl(URL: string ):TPicture;
  property Processing:boolean read _Processing;
  Constructor Create;
  destructor Destroy; override;
end;

implementation

{TWSClient}
constructor TWSClient.Create;
begin
  _RESTClient:=tRESTClient.Create('');
  _RESTRequest:=TRESTRequest.Create(nil);
  _RESTResponse:=TRESTResponse.Create(nil);
  _RESTRequest.Client:=_RESTClient;
  _RESTRequest.Response:= _RESTResponse;
  _idHTTP:=tidHttp.Create(nil);
end;

Destructor TWSClient.Destroy;
begin
  _RESTRequest.Free;;
  _RESTResponse.Free;;
  _RESTClient.Free;;
  _idHTTP.free;
end;

function TWSClient.getJson(aURL:string):string;
begin
  _RESTClient.BaseURL:=aURL;
  _RESTClient.Accept:='application/json';
  _RestClient.AcceptCharset:='utf-8, *;q=0.8';
  _RESTRequest.Execute;
  result:= _RESTResponse.Content;
end;

procedure TWSClient.JsonToDataset(URL:string;toDataset:TDataset);
var JO:TJSONObject;JA:TJSONArray;JP:TJSONPair;
  I: Integer;
  j: Integer;
  aJSON: string;
begin
  _Processing:=true;
  aJSON:=getJson(url);
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
  _Processing:=false;
end;

function TWSClient.GetImageByUrl(URL: string):TPicture;
var
  Strm: TMemoryStream;
  Picture:TPicture;
begin
  Picture:=tpicture.Create;
  result:= Picture;
  if _processing then
    exit;
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

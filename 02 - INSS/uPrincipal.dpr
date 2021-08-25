program uPrincipal;

uses
  Vcl.Forms,
  Aliq.Carro in '..\03 - ALÍQT. CAR\Aliq. Carro.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

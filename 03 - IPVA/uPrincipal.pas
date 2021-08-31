unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    lblValorCarro: TLabel;
    edtValor: TEdit;
    cboTipoVeiculo: TComboBox;
    lblTipoVeiculo: TLabel;
    btnCalcular: TButton;
    btnLimpar: TButton;
    lbxResultado: TListBox;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private

  const
    AUTOMOVEIS = 0.04;
    CAMINHONETES = 0.03;
    TRANSPORTE_PUBLICO = 0.02;
    VEICULOS_LOCADORES = 0.01;
    ONIBUS_CAMINHAO = 0.01;

    procedure ValidarCampos;
    procedure LimparCampos;
    function CalcularImposto(pValorVeiculo: Real; pTipoVeiculo: Integer): Real;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }
      {
procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  ValidarCampos;
  {ShowMessage('O valor do imposto �: ' +
   FloatToStr(CalcularImposto(StrToFloat(edtValor.Text), cboTipoVeiculo.ItemIndex)));

  lblValorCarro := StrToFloat(edtValor.Text);
  lbxResultado.Items.Add('O imposto
end;
 }
 procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
var
  lValorVeiculo: Real;
begin
  ValidarCampos;
  lValorVeiculo := StrToFloat(edtValor.Text);
  lbxResultado.Items.Add('O imposto do ve�culo de valor ' +
    FormatFloat('R$ #,##0', lValorVeiculo) + ' do tipo ' +
    cboTipoVeiculo.Text + ' �: ' +
    FormatFloat(
      'R$ #,##0',
      CalcularImposto(lValorVeiculo,
      cboTipoVeiculo.ItemIndex)
    )
  );
  LimparCampos;
  edtValor.SetFocus;
end;
procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  lbxResultado.Items.Clear;
end;

function TfrmPrincipal.CalcularImposto(pValorVeiculo: Real;
  pTipoVeiculo: Integer): Real;
var
  lValorImposto: Real;
begin
  case pTipoVeiculo of
  0: lValorImposto := (pValorVeiculo * AUTOMOVEIS);
  1: lValorImposto := (pValorVeiculo * CAMINHONETES);
  2: lValorImposto := (pValorVeiculo * TRANSPORTE_PUBLICO);
  3: lValorImposto := (pValorVeiculo * VEICULOS_LOCADORES);
  4: lValorImposto := (pValorVeiculo * ONIBUS_CAMINHAO);
  end;

  Result := lValorImposto;
end;

procedure TfrmPrincipal.LimparCampos;
begin
  edtValor.Clear;
  cboTipoVeiculo.ItemIndex := -1;
end;

procedure TfrmPrincipal.validarCampos;
begin
  if edtValor.Text = '' then
  begin
    ShowMessage('O valor do ve�culo deve ser preenchido!');
    edtValor.SetFocus;
    Abort;
  end;

  if cboTipoVeiculo.ItemIndex = -1 then
  begin
    ShowMessage('O tipo do ve�culo deve ser informado!');
    cboTipoVeiculo.SetFocus;
    Abort;
  end;
end;

end.

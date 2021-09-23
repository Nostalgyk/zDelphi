unit uPrincipal;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    gbxControle: TGroupBox;
    lblBanda: TLabel;
    cboBanda: TComboBox;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    lbxResultado: TListBox;
    btnSair: TBitBtn;
    btnInformacoes: TBitBtn;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnInformacoesClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
  type
    TTipoMensagem = (Informacao, Alerta, Erro);

  const
    cNOME_SISTEMA = 'Controle de Discos';
    cVALOR_ZERO = 0;
    cVALOR_VAZIO = -1;

  var
    FQuantidadeRegistrosInseridos,
    FQuantidadeRegistrosExcluidos: integer;

    procedure ExibirMensagem(pMensagem: string; pTipoMensagem: TTipoMensagem);

    procedure ValidarInsercao;
    procedure ValidarExclusao;
    procedure ValidarLancamentoDuplicado;
    procedure AdicionarBanda;
    procedure RemoverBanda;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Winapi.Windows;

{$R *.dfm}

procedure TfrmPrincipal.AdicionarBanda;
begin
  lbxResultado.Items.Add(cboBanda.Text);
  cboBanda.ItemIndex := -1;
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
begin
  ValidarInsercao;
  ValidarLancamentoDuplicado;
  AdicionarBanda;
  Inc(FQuantidadeRegistrosInseridos);
end;

procedure TfrmPrincipal.btnInformacoesClick(Sender: TObject);
begin
  ExibirMensagem('Informa��es: ' + #13 + #13 +
    'Total de registros: ' + IntToStr(lbxResultado.Items.Count) + #13 +
    'Total de lan�amentos: ' + IntToStr(FQuantidadeRegistrosInseridos) + #13 +
    'Total de exclus�es: ' + IntToStr(FQuantidadeRegistrosExcluidos), Informacao);
end;

procedure TfrmPrincipal.btnRemoverClick(Sender: TObject);
begin
  ValidarExclusao;
  RemoverBanda;
  Inc(FQuantidadeRegistrosExcluidos);
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Halt;
end;

procedure TfrmPrincipal.ExibirMensagem(pMensagem: string;
  pTipoMensagem: TTipoMensagem);
begin
  case pTipoMensagem of
    Informacao: Application.MessageBox(PChar(pMensagem), PWideChar(cNOME_SISTEMA), MB_ICONINFORMATION);
    Alerta: Application.MessageBox(PChar(pMensagem), PWideChar(cNOME_SISTEMA), MB_ICONWARNING);
    Erro: Application.MessageBox(PChar(pMensagem), PWideChar(cNOME_SISTEMA), MB_ICONERROR);
  end;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  FQuantidadeRegistrosInseridos := cVALOR_ZERO;
  FQuantidadeRegistrosExcluidos := cVALOR_ZERO;
end;

procedure TfrmPrincipal.RemoverBanda;
begin
  lbxResultado.Items.Delete(lbxResultado.ItemIndex);
end;

procedure TfrmPrincipal.ValidarExclusao;
begin
  if lbxResultado.Items.Count = cVALOR_ZERO then
  begin
    ExibirMensagem('N�o h� registros a serem exclu�dos.', Alerta);
    Abort;
  end;

  if lbxResultado.ItemIndex = cVALOR_VAZIO then
  begin
    ExibirMensagem('Selecione a banda a ser removida.', Alerta);
    Abort;
  end;
end;

procedure TfrmPrincipal.ValidarInsercao;
begin
  if cboBanda.ItemIndex = cVALOR_VAZIO then
  begin
    ExibirMensagem('Selecione a banda a ser adicionada.', Alerta);
    cboBanda.SetFocus;
    Abort;
  end;
end;

procedure TfrmPrincipal.ValidarLancamentoDuplicado;
var
  i: Integer;
begin
  for i := cVALOR_ZERO to Pred(lbxResultado.Items.Count) do
    if lbxResultado.Items[i] = cboBanda.Text then
    begin
      ExibirMensagem('A banda "' + cboBanda.Text + '" j� foi adicionada.' + #13 +
        'A opera��o ser� cancelada.', Alerta);
      Abort;
    end;
end;

end.

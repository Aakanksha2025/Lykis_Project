pageextension 50148 PostedSalesInvExt extends "Posted Sales Invoices"
{
    layout
    {
        addafter(Amount)
        {
            field(AmountLCY; AmountLCY)
            {
                Caption = 'Amount LCY';
                ApplicationArea = all;
            }

        }
    }
    trigger OnAfterGetRecord()
    begin

        if rec."Currency Factor" <> 0 then
            AmountLCY := Rec.Amount / rec."Currency Factor"
        else
            AmountLCY := rec.Amount;
    end;

    var
        AmountLCY: Decimal;
}

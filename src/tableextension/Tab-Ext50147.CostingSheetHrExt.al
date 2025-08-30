tableextension 50147 CostingSheetHrExt extends "Costing Sheet Header"
{
    fields
    {

        field(50147; "Purchase Quote List"; Integer)
        {
            Caption = 'Purchase Quote List';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Enquiry No." = field("Sales Enquiry No."), "Document Type" = const(Quote)));

        }
        field(50148; "Performa Invoice List"; Integer)
        {
            Caption = 'Performa Invoice List';
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Sales Enquiry No." = field("Sales Enquiry No.")));

        }



    }
}

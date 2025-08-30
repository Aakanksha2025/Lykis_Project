tableextension 50145 SalesEnquiryHrExt extends "Sales Enquiry Header"
{
    fields
    {
        field(50145; "Quote Compare List"; Integer)
        {
            Caption = 'Quote Compare List';
            FieldClass = FlowField;
            CalcFormula = count("Quote Compare Header" where("SE No." = field("Enquiry No.")));

        }
        field(50147; "RFQ List"; Integer)
        {
            Caption = 'RFQ List';
            FieldClass = FlowField;
            CalcFormula = count("Request For Quotation Header " where("Enquiry No." = field("Enquiry No.")));

        }

        field(50146; "Purchase Quote List"; Integer)
        {
            Caption = 'Purchase Quote List';
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Enquiry No." = field("Enquiry No."), "Document Type" = const(Quote)));

        }



    }
}

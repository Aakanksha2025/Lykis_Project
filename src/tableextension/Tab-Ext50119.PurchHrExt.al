tableextension 50119 PurchHrExt extends "Purchase Header"
{
    fields
    {
        field(50119; "QC Sample Entries"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("QC Entry Header" where("PO No." = field("No."), "Document Type" = const(Quote)));
            // Editable = false;
        }
        field(50120; "Quote Compare List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Quote Compare Header" where("RFQ No" = field("RFQ No.")));
        }
        field(50121; "REQ List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Request For Quotation Header " where("RFQ No." = field("RFQ No.")));
        }
        field(50122; "Sales Enquiry List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Enquiry Header" where("Enquiry No." = field("Enquiry No.")));
        }
        //Aakanksha02072025
        field(50123; "Costing Sheet List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Costing Sheet Header" where("Document No." = field("Cost Sheet No.")));
        }

        field(50124; "Performa Invoice List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("No." = field("Proforma Invoice No.")));
        }
        field(50125; "Purchase Quote List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Quote No." = field("No.")));
        }

        field(50126; "Purchase Order List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Enquiry No." = field("Enquiry No."), "Document Type" = const(order)));
        }








        //  modify( "RFQ No.")
        // {
        //     TableRelation = "Request For Quotation Header "."RFQ No." where("RFQ No."= field("RFQ No."));

        // }
        modify("Enquiry No.")
        {
            TableRelation = "Sales Enquiry Header"."Enquiry No." where("Enquiry No." = field("Enquiry No."));
        }


    }

}

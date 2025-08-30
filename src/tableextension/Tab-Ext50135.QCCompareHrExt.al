tableextension 50135 QCCompareHrExt extends "Quote Compare Header"
{
    fields
    {
        field(50135; "Purchase Quote"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("RFQ No." = field("RFQ No"), "Document Type" = const(Quote)));
        }

        field(50136; "REQ List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Request For Quotation Header " where("RFQ No." = field("RFQ No")));
        }
        field(50137; "Sales Enquiry List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Enquiry Header" where("Enquiry No." = field("SE No.")));
        }
        field(50138; "Porfoma Invoice List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Header" where("Sales Enquiry No." = field("SE No.")));
        }
        field(50139; "Costing Sheet List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Costing Sheet Header" where("Sales Enquiry No." = field("SE No.")));
        }


        // modify("RFQ No")
        // {
        //     TableRelation = "Request For Quotation Header "."RFQ No." where("RFQ No." = field("RFQ No"));

        // }
        // modify("SE No.")
        // {
        //     TableRelation = "Sales Enquiry Header"."Enquiry No." where("Enquiry No." = field("SE No."));
        // }
    }

    // trigger OnInsert()
    // var
    //     ExistingQuote: Record "Quote Compare Header"; // same table
    // begin
    //     // Check if RFQ No. already used in another quote
    //     if "RFQ No" <> '' then begin
    //         ExistingQuote.SetRange("RFQ No", "RFQ No");
    //         if ExistingQuote.FindFirst() then
    //             Error('You are not able to create a quote because this RFQ No. is already used.');
    //     end;
    // end;
}



pageextension 50131 QuoteComareCardExt extends "Quote Compare Card"
{
    layout
    {
        addafter(Remark)
        {
            field("Purchase Quote"; rec."Purchase Quote")
            {
                Caption = 'Purchase Quote List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHeader.SetRange("RFQ No.", Rec."RFQ No");
                    Page.Run(Page::"Purchase Quotes", PurchHeader);
                end;
            }

            field("Costing Sheet List"; Rec."Costing Sheet List")
            {
                Caption = 'Costing Sheet List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    CostingHeader: Record "Costing Sheet Header";
                begin
                    CostingHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    CostingHeader.SetRange("Sales Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Costing Sheet list", CostingHeader);
                end;
            }

            field("Porfoma Invoice List"; Rec."Porfoma Invoice List")
            {
                Caption = 'Porfoma Invoice List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesHeader.SetRange("Sales Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Sales Order List", SalesHeader);
                end;
            }
        }
        addafter("RFQ No")
        {
            field("REQ List"; Rec."REQ List")
            {
                Caption = 'RFQ List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    ReqHeader: Record "Request For Quotation Header ";
                begin
                    ReqHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    ReqHeader.SetRange("RFQ No.", Rec."RFQ No");
                    Page.Run(Page::"Request For Quotation List", ReqHeader);
                end;
            }

        }
        addafter("SE No.")
        {
            field("Sales Enquiry List"; Rec."Sales Enquiry List")
            {
                Caption = 'Sales Enquiry List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesEnqHeader: Record "Sales Enquiry Header";
                begin
                    SalesEnqHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesEnqHeader.SetRange("Enquiry No.", Rec."SE No.");
                    Page.Run(Page::"Sales Enquiry List", SalesEnqHeader);
                end;
            }
        }
    }
}

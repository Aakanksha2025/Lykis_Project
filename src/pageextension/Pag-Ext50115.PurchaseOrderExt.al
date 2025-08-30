pageextension 50115 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        addafter("QC Done ByL")
        {
            field("QC Sample Entries"; Rec."QC Sample Entries")
            {
                Caption = 'QC Sample Entries';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    QCEntryHeader: Record "QC Entry Header";
                begin
                    QCEntryHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    QCEntryHeader.SetRange("PO No.", Rec."No.");
                    Page.Run(Page::"QC Sample Entry list", QCEntryHeader);
                end;
            }

            field("Performa Invoice List"; Rec."Performa Invoice List")
            {
                Caption = 'Performa Invoice List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesHeader.SetRange("No.", rec."Proforma Invoice No.");
                    Page.Run(Page::"Sales Order List", SalesHeader);
                end;
            }
            field("Costing Sheet List"; Rec."Costing Sheet List")
            {
                Caption = 'Costing Sheet List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    CostHr: Record "Costing Sheet Header";
                begin
                    CostHr.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    CostHr.SetRange("Document No.", rec."Cost Sheet No.");
                    Page.Run(Page::"Costing Sheet list", CostHr);
                end;
            }
            field("Sales Enquiry List"; Rec."Sales Enquiry List")
            {
                Caption = 'Sales Enquiry List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    SalesEnquiryHeader: Record "Sales Enquiry Header";
                begin
                    SalesEnquiryHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    SalesEnquiryHeader.SetRange("Enquiry No.", Rec."Enquiry No.");
                    Page.Run(Page::"Sales Enquiry List", SalesEnquiryHeader);
                end;
            }
            field("Purchase Quote List"; Rec."Purchase Quote List")
            {
                Caption = 'Purchase Quote List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchHr: Record "Purchase Header";
                begin
                    PurchHr.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    PurchHr.SetRange("Quote No.", rec."No.");
                    Page.Run(Page::"Purchase Quotes", PurchHr);
                end;
            }



        }


    }
}

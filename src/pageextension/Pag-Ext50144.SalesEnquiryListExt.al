pageextension 50144 SalesEnquiryListExt extends "Sales Enquiry Card"
{
    layout
    {
        addafter("Purchase Person")
        {
            field("Quote Compare List"; Rec."Quote Compare List")
            {
                Caption = 'Quote Compare List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    QuoteComHeader: Record "Quote Compare Header";
                begin
                    QuoteComHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    QuoteComHeader.SetRange("SE No.", Rec."Enquiry No.");
                    Page.Run(Page::"Quote Compare List", QuoteComHeader);
                end;
            }
            field("Purchase Quote List"; Rec."Purchase Quote List")
            {
                Caption = 'Purchase Quote List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    PurchQuoteHeader: Record "Purchase Header";
                begin
                    PurchQuoteHeader.Reset();
                    PurchQuoteHeader.SetRange("Enquiry No.", Rec."Enquiry No.");
                    Page.Run(Page::"Purchase Quotes", PurchQuoteHeader);
                end;
            }
            field("RFQ List"; Rec."RFQ List")
            {
                Caption = 'RFQ List';
                ApplicationArea = all;
                Editable = false;

                trigger OnDrillDown()
                var
                    RequestQuoteHeader: Record "Request For Quotation Header ";
                begin
                    RequestQuoteHeader.Reset();
                    //PurchHeader.SetRange("Document Type", rec."Document Type"::Quote);
                    RequestQuoteHeader.SetRange("Enquiry No.", Rec."Enquiry No.");
                    Page.Run(Page::"Request For Quotation List", RequestQuoteHeader);
                end;
            }
        }
    }
}

pageextension 50147 RequestForQuotationExt extends "Request For Qut Card"
{
    layout
    {
        addafter("Enquiry No.")
        {
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
        }
    }
}

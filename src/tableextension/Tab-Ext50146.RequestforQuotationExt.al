tableextension 50146 RequestforQuotationExt extends "Request For Quotation Header "
{
    fields
    {
        field(50146; "Sales Enquiry List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Enquiry Header" where("Enquiry No." = field("Enquiry No.")));


        }
    }
}

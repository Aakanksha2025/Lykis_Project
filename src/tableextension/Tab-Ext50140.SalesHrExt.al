tableextension 50140 SalesHrExt extends "Sales Header"
{
    fields
    {
        field(50140; "Sales Enquiry List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Sales Enquiry Header" where("Enquiry No." = field("Sales Enquiry No.")));
        }
        field(50141; "Costing Sheet List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Costing Sheet Header" where("Sales Enquiry No." = field("Sales Enquiry No.")));
        }
        //Aakanksha02072025
           field(50142; "Purchase Order List"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Purchase Header" where("Proforma Invoice No."= field("No.")));
        }
        //Aakanksha02072025

    }
}

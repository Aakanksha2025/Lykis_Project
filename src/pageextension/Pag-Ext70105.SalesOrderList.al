pageextension 70111 SalesList extends "Sales Order List"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Purchase Order List"; Rec."Purchase Order List")
            {
                ApplicationArea = all;
            }
        }
    }
}

tableextension 50106 SalesHrExtup extends "Sales Header"
{

    fields
    {
        modify("Due Date")
        {
            trigger OnBeforeValidate()
            var
                RecSL: Record "Sales Line";
            begin
                RecSL.Reset();
                RecSL.SetRange("Document No.", Rec."No.");
                if RecSL.FindSet() then
                    repeat begin
                        RecSL."Planned Shipment Date" := Rec."Due Date";
                        RecSL.Modify();
                    end;
                    until RecSL.Next() = 0;
            end;
        }
    }
}

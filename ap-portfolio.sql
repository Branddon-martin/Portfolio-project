-- Brandon Martin


use ap;

-- Query 1 - The number of vendors from California.
select count(*)
from vendors
where vendor_state = 'CA';

-- Query 2 - The number of vendors from each state.
select vendor_state, count(*)
from vendors
group by vendor_state;

-- Query 3 - The total of all invoices from each vendor. 
select vendor_id, sum(invoice_total)
from invoices
group by vendor_id;

-- Query 4 - All individual invoices from each vendor with the vendor identified by both ID and Name.

select *
from invoices as i, vendors as v
where i.vendor_id = v.vendor_id;


-- Query 5 with JOIN
select *
from invoices as i
	join vendors as v
		on i.vendor_id = v.vendor_id;

-- Query 6 - The total of all invoices from each vendor with the vendor identified by both ID and Name.

select i.vendor_id, v.vendor_name, sum(invoice_total)
from invoices as i, vendors as v
where i.vendor_id = v.vendor_id
group by i.vendor_id, v.vendor_name;


-- Query 7 with JOIN 
select i.vendor_id, v.vendor_name, sum(invoice_total)
from invoices as i
	join vendors as v
		on i.vendor_id = v.vendor_id
group by i.vendor_id, v.vendor_name;

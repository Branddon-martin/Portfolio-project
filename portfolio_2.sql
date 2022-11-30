-- Brandon Martin

use zagi;

-- Query 1 - The number of products supplied by vendor ‘PG’
select count(*)
from product 
where vendorid = 'PG';

-- Query 2 - The number of products supplied by each vendor with the vendor identified by vendor ID
select vendorid,count(*)
from product 
group by vendorid;

-- Query 3 - The highest, lowest, and average product prices for all products
select min(productprice), max(productprice), avg(productprice)
from product;

-- Query 4 - The highest, lowest, and average product price for each product category
select categoryid, min(productprice), max(productprice), avg(productprice)
from product
group by categoryid; 

-- Query 5 - The number of products supplied by each vendor with the vendor identified by both ID and name.
select v.vendorid, v.vendorname, count(*)
from product as p, vendor as v
where p.vendorid = v.vendorid
group by v.vendorid;

use ap;

-- Query 6 - The number of vendors from California.
select count(*)
from vendors
where vendor_state = 'CA';

-- Query 7 - The number of vendors from each state.
select vendor_state, count(*)
from vendors
group by vendor_state;

-- Query 8 - The total of all invoices from each vendor. 
select vendor_id, sum(invoice_total)
from invoices
group by vendor_id;

-- Query 9 - All individual invoices from each vendor with the vendor identified by both ID and Name.

select *
from invoices as i, vendors as v
where i.vendor_id = v.vendor_id;


-- Query 9 with JOIN
select *
from invoices as i
	join vendors as v
		on i.vendor_id = v.vendor_id;

-- Query 10 - The total of all invoices from each vendor with the vendor identified by both ID and Name.

select i.vendor_id, v.vendor_name, sum(invoice_total)
from invoices as i, vendors as v
where i.vendor_id = v.vendor_id
group by i.vendor_id, v.vendor_name;


-- Query 10 with JOIN 
select i.vendor_id, v.vendor_name, sum(invoice_total)
from invoices as i
	join vendors as v
		on i.vendor_id = v.vendor_id
group by i.vendor_id, v.vendor_name;

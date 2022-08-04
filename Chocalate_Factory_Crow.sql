create database Manufacturer

create table Product(
	prod_id INT NOT NULL,
	prod_name VARCHAR(50) NOT NULL,
	quantity INT NOT NULL,
		CONSTRAINT prod_pk PRIMARY KEY (prod_id)
);

create table Supplier(
	supp_id INT NOT NULL,
	supp_location VARCHAR(50) NOT NULL,
	supp_country VARCHAR(50) NOT NULL,
	is_active BIT DEFAULT 1,
		CONSTRAINT supp_pk PRIMARY KEY (supp_id)
);

create table Component(
	comp_id INT NOT NULL,
	comp_name VARCHAR(50) NOT NULL,
	description VARCHAR(50) NOT NULL,
	quantity_comp INT NOT NULL,
		CONSTRAINT comp_pk PRIMARY KEY (comp_id)
);

CREATE TABLE Prod_Comp
(
	prod_id INT NOT NULL,
	comp_id INT NOT NULL,
	quantity_comp INT NOT NULL,
		CONSTRAINT prod_comp_pk PRIMARY KEY (prod_id,comp_id),
		CONSTRAINT prod_comp_fk_product FOREIGN KEY (prod_id) REFERENCES Product(prod_id),
		CONSTRAINT prod_comp_fk_component FOREIGN KEY(comp_id) REFERENCES Component(comp_id)
);

create table  Comp_Supp(
	supp_id INT NOT NULL,
	comp_id INT NOT NULL,
	order_data DATE NOT NULL,
	quantity INT NOT NULL,
		CONSTRAINT comp_supp_pk PRIMARY KEY (supp_id, comp_id),
		CONSTRAINT comp_supp_fk_supplier FOREIGN KEY (supp_id) REFERENCES Supplier(supp_id),
		CONSTRAINT comp_supp_fk_component FOREIGN KEY (comp_id) REFERENCES Component(comp_id)
);
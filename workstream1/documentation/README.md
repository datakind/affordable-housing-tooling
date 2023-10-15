# Definitions of Fields in the Web Form

## Property Identification

- ```txtPPN```	is the name of the proposed project. 
  It must be a string without spaces nor special characters.

- ```txtAddr1```	is the first line of the address of the proposed building. 
  It must be a nonempty string. 

```txtAddr2```	is the second line of the address of the proposed building. 
  It must be a string but could be empty. 

```txtCity```	is the city in which the proposed building is located. 
  It must be a nonempty string. 

```txtState```	is the acronym for the state in which the proposed building is located. 
  It must be a nonempty string comprising two upper-case letters, which could be defined by a drop-down menu. 

```txtZIP```	is the ZIP code in which the proposed building is located. 
  It must be a positive integer five digits long
  and, preferably, a valid ZIP code. 


## Financing information


```txtTotProjCost```	is the total projected cost of the building project. 
  It must be a positive integer. 

```txtNoCmfClf```		is the amount of financing for the project
obtained from the Florida Community Loan Fund (FCLF),
from sources other than the Capital Magnet Fund (CMF) for which this application is filed. 
  It must be a positive integer less than ```txtTotProjCost```. 

```txtPrivCash```		is the amount of financing for the project
obtained from other private sources of financing. 
  It must be a positive integer less than ```txtTotProjCost```.

```txtGovCash```		is the amount of financing for the project
obtained from government sources other than
the Florida Community Loan Fund (FCLF)
and the Capital Magnet Fund (CMF) for which this application is filed. 
  It must be a positive integer less than ```txtTotProjCost```. 

```txtCMFLoan```		is the remaining amount of financing for the project obtained from the Capital Magnet Fund (CMF) 
for which this application is filed. 
  It must be a positive integer less than ```txtTotProjCost```.
  Furthermore, the sum of 
  ```txtNoCmfClf```, ```txtPrivCash```, ```txtGovCash```, 
  and ```txtCMFLoan``` must equal ```txtTotProjCost```.


## Inventory of Units


```txtUnitCount```	is the total number of housing units in the proposed housing development. 
  It must be a positive integer. 

```txtUnder30```	is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
below 30 percent of the Area Median Income (AMI). 
  It must be a positive integer less than ```txtUnitCount```. 

```txtUnder50```	is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
between 30 percent and 50 percent of the AMI. 
  It must be a positive integer less than ```txtUnitCount```. 

```txtUnder60```		is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
between 50 percent and 60 percent of the AMI. 
  It must be a positive integer less than ```txtUnitCount```. 

```txtUnder80```		is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
between 60 percent and 80 percent of the AMI. 
  It must be a positive integer less than ```txtUnitCount```. 

```txtUnder120```		is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
between 80 percent and 120 percent of the AMI. 
  It must be a positive integer less than ```txtUnitCount```. 

```txtAbove120``` 	is the total number of housing units in the proposed housing development 
that will be rented to families with incomes 
above 120 percent of the AMI. 
  It must be a positive integer less than ```txtUnitCount```. 

  Furthermore, the sum of 
  ```txtUnder30```, ```txtUnder50```, ```txtUnder60```, 
  ```txtUnder80```, ```txtUnder120```, 
  and ```txtAbove120``` must equal ```txtUnitCount```.





# Images of the Whiteboard

Just in case the clean-up crew visits on Saturday night.

Original allocation of tasks:

<img src="Images/housing_tool_whiteboard_1.jpg" width="500"/>

Flow chart of applications (sketch):

<img src="Images/housing_tool_whiteboard_2.jpg" width="500"/>

Definition of "Very Low Income":

<img src="Images/housing_tool_whiteboard_3.jpg" width="500"/>

Conditions for eligibility of projects
and overall constraints on portfolio of grants:

<img src="Images/housing_tool_whiteboard_4.jpg" width="500"/>

Initial list of fields in test cases and web form:

<img src="Images/housing_tool_whiteboard_5.jpg" width="500"/>

Sketch of UI for grant applications:

<img src="Images/housing_tool_whiteboard_6.jpg" width="500"/>

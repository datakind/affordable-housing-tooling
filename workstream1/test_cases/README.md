# Test Cases

## Test Cases for Data Entry Errors

The file ```test_cases_data_entry.csv``` contains test cases 
to determine whether the fields are entered in valid formats. 




# Test Cases for Checks on Parameters of Grant Applications

The file ```test_cases_grant_apps.csv``` contains test cases 
to determine whether the construction projects
described in the applications are eligible for support
from the Capital Magnets Loan Fund from the FCLF.
Several cases are eligible at the level of the individual project
but would push a portfolio of projects out of the overall eligibility
constraints if too many such projects were funded.

The following sample applications are included.

1. ```SOS_ED_Y_HO_N``` is based on the project "SOS" from the [https://docs.google.com/spreadsheets/d/1qOzzP9Gyhl86o2OPK1iCVCdhrFu_WRgF/edit#gid=2102603070](CMF tool). These values represent an application that would have a low
percentage of units made available to families with incomes at 50% AMI or below, 
which may push the portfolio below the threshold of 60 percent. *[Note: the suffix ```ED_Y_HO_N``` indicates that this case has an address in an area that likely qualifies as an Area of Economic Distress. Later versions could include an address that is not also in a High-Opportunity  Area for Eligible-Income Families.]*

1. ```SOS_ED_Y_HO_Y``` is a copy of the above case 
with an address in an area that likely qualifies as an Area of Economic Distress but but, in later versions,
would have an address that *is not* also in a High-Opportunity Area for Eligible-Income Families.

1. ```SOS_ED_N_HO_Y``` is a copy of the above case 
with an address in an area that likely *does not*
qualify as an Area of Economic Distress but but, in later versions,
would have an address that *is* also in a High-Opportunity Area for Eligible-Income Families.

1. ```SOS_ED_N_HO_N``` is a copy of the above case 
with an address in an area that likely would *not*
qualify as an Area of Economic Distress *nor*, 
even in later versions,
would have an address that is also in a High-Opportunity Area for Eligible-Income Families.

1. ```SSW_check``` is based on the project "SSW" 
from the CMF tool. It is the base case that should 
be both eligible for financing and push a portfolio
of grants further into the constraint set for overall conditions. 

1. ```SSW_source_err``` is a copy of the above case 
with a mismatch in the total amounts of sources of financing: the total financing sources do not match 
Total Project Costs. 

1. ```SSW_unit_err``` is a copy of the above case 
with a mismatch in the total number of units:
the total number of units does not match the sum
of the numbers of units to be rented to families
in the various income categories. 

1. ```OHA``` is based on the project "OHA" 
from the CMF tool. 

1. ```PBF``` is based on the project "PBF" 
from the CMF tool. 

1. ```CMC``` is based on the project "CMC" 
from the CMF tool. 

1. ```WP``` is based on the project "WP" 
from the CMF tool. 

1. ```AG``` is based on the project "AG" 
from the CMF tool. 

1. ```CP``` is based on the project "CP" 
from the CMF tool. 

1. ```JB``` is based on the project "JB" 
from the CMF tool. 

1. ```AP``` is based on the project "AP" 
from the CMF tool. 

1. ```CL1``` is based on the project "CL1" 
from the CMF tool. 

1. ```CL2``` is based on the project "CL2" 
from the CMF tool. 

1. ```PC``` is based on the project "PC" 
from the CMF tool. 







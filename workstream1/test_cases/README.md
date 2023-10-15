# Test Cases

## Test Cases for Data Entry Errors

The file ```test_cases_data_entry.csv``` contains test cases 
to determine whether the fields are entered in valid formats. 
Unless testing the field ```txtPPN``` itself,
the project names are based on the project "SSW" 
from the the [CMF tool](https://docs.google.com/spreadsheets/d/1qOzzP9Gyhl86o2OPK1iCVCdhrFu_WRgF/edit#gid=2102603070). 

1. The first case should not throw an error. It is used as the benchmark case.

1. The next two cases test whether the user interface 
gives a warning message if the ```txtPPN``` 
field is either an empty string or a number. 

1. The next case tests whether the user interface 
gives a warning message if the first address field is empty. 

1. The next four cases test whether 
the ```City``` and ```State``` 
cause the user interface to give a warning message 
if each of the fields are, respectively,
empty strings or numbers. 

1. The next ten cases test whether the 
amounts of financing 
cause the user interface to give a warning message 
if each of the fields are
strings, whether empty or otherwise. 

1. The next sixteen cases test whether the 
counts of the number of units
cause the user interface to give a warning message 
if each of the fields are
strings, whether empty or otherwise. 



# Test Cases for Checks on Parameters of Grant Applications

The file ```test_cases_grant_apps.csv``` contains test cases 
to determine whether the construction projects
described in the applications are eligible for support
from the Capital Magnets Loan Fund from the FCLF.
Several cases are eligible at the level of the individual project
but would push a portfolio of projects out of the overall eligibility
constraints if too many such projects were funded.

The following sample applications are included.

1. ```SOS_ED_Y_HO_N``` is based on the project "SOS" from the [CMF tool](https://docs.google.com/spreadsheets/d/1qOzzP9Gyhl86o2OPK1iCVCdhrFu_WRgF/edit#gid=2102603070). 
These values represent an application that would have a low
percentage of units made available to families with incomes at 50% AMI or below, 
which may push the portfolio below the threshold of 60 percent. *[Note: the suffix ```ED_Y_HO_N``` indicates that this case has an address in an area that likely qualifies as an Area of Economic Distress. Later versions could include an address that is not also in a High-Opportunity Area for Eligible-Income Families.]*

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
  This project tests the lower bound for the multiplier of private funding, since it has zero private funding but some government funding

1. ```PBF``` is based on the project "PBF" 
from the CMF tool. 
  It provides an exampe of a project with a minimal multiplier of 2.5 but a maximal number of units designated for low-income families, with 100 percent. 
    This can be used to examine portfolio allocation rules
    that sacrifice the multiplier for extra service toward the goals of the CMF program.

1. ```CMC``` is based on the project "CMC" 
from the CMF tool. 
  This is an alternative to the ```CMC``` project above, with a low multiplier but a medium level of units available for low-income families. 

1. ```WP``` is based on the project "WP" 
from the CMF tool. 
  This is another alternative to the ```CMC``` project above, but with a (slightly higher) low multiplier but 100 percent of units available for low-income families. 

1. ```AG``` is based on the project "AG" 
from the CMF tool. 
  This project has both a high multiplier and a high ratio
  of units available for low-income families. 
  It can be used to evaluate portfolio allocation rules, 
  since it will likely be awarded a grant.

1. ```CP``` is based on the project "CP" 
from the CMF tool. 
This is an alternative to the ```AG``` project above, 
with a high multiplier but only 10 percent of units available for low-income families, which is below the threshold for
eligibility. It should be rejected for a CMF grant.

1. ```JB``` is based on the project "JB" 
from the CMF tool. 
This is an intermediate case with a moderately low multiplier
of 6 and a barely-passable 20.5 percent 
of units available for low-income families
  Whether this project is funded will depend on the precise parameters of the portfolio evaluation stategy. 

1. ```AP``` is based on the project "AP" 
from the CMF tool. 
This case is similar to ```AP```
with a marginal 22.9 percent 
of units available for low-income families
but a multiplier of 9, which is only slightly below
the overall target of 10. 
It tests a portfolio allocation strategy 
for whether a reasonable multiplier for a project 
will make up for a minimal contribution of housing 
for low-income families.

1. ```CL1``` is based on the project "CL1" 
from the CMF tool. 
This project has capital multipliers
and low-income family percantages within bounds
but tests for errors in the allocation of housing units
across income categories. The total allocation of units 
to income categories does not match the sum of the number of units: the total is *higher* than the number of units. 

1. ```CL2``` is based on the project "CL2" 
from the CMF tool. 
This case is an analogue for the case ```CL1```, 
except that the total allocation of units 
to income categories does not match the sum of the number of units: the total is *lower* than the number of units. 

1. ```PC``` is based on the project "PC" 
from the CMF tool. 
Similar to the case ```PBF```, except that ```PC```
includes public funding sources while ```PBF```
had zero funding from public sources. 
Differences in the two cases should distinguish between 
allocation rules that favor either private or public funding. 







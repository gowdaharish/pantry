#### Project Overview
This project represents a pantry, think of it like a place where you can store different varities of food items and you can change the date of make ( or expiration day) for those items by clicking on those items.

The main functionalities can be categorised into:  
1. Adding food item  
2. Deleting food item  
3. Editing food item  

* To add a food item, use the button at botton right corner. This will bring up the "add" menu where you can select your values for the food item and add it to the list.  
* To delete a food item that is already been added to the list, hover over the item and you can see the delete icon appearing on the right side of the item and click it.  
* To edit an item, click on anywhere on the item except on the delete button. Which will bring up the "edit" menu whcih you can use to change existing values of the item. 

#### Project Structure
The project has `src` part which contains the necessary files to run the project.
And the `tests` part which contains the necessary files to run the tests.
	

#### Build steps
Since it is a qmake project, you can just open the root `.pro` file to load the project into `qtCreator` or `Visual Studio`.
Once you have loaded just build and run.

#### Notes
1. The delete button on the right of the listview items can stick up when moving the mouse too fast from one item to the other, which can cause the mouse hover to be lost
for some items while editing or after adding a new item. WHich is a bug somwhere with mouse hover which I believe was fixed in `5.13.0` or some future version. So if you
find that some elements are not interactive then make sure that `delete` button is not stuck for that item, if it is then you can clear it by just hover over it again and
hover back out.

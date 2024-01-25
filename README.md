# FEM Truss Structure Analysis
Analyse 2D Truss structures with Finite Element Method through Matlab code. 
This includes a GUI in Matlab where the user can manually define each node, element, and boundary condition, 
or read an Excel file with the Node Element List to construct the structure, for convenience.

## How to use
### Generate the structure
Enter the x and y coordinates of a node, and click the "Generate Node" button. 
For generating elements, enter the start and end nodes, and click "Generate Element".

Alternatively, construct a structure by importing the Node Element List as an Excel file.
Refer to the SampleList file provided.

The Node List and the Element List are shown on the right-hand side.

The generated structure will appear on the bottom.

Make sure to clear the previous nodes, elements and boundary conditions before creating a new structure.

### Boundary Conditions
To assign boundary conditions, enter the node label number, and select the appropriate direction and type. 
Finally, enter the Magnitude of the boundary condition to be applied, and click "Apply BC".

### Solve and Post-Process
The Young's Modulus and Surface Area must be entered in order to perform the calculations.

Click the "Solve" button, and navigate to the "Post-Processing" tab to view the solutions. The resulting displacements can be viewed on a graph or a list. 
The graph can be exaggerated through "Magnification" for visual purposes. 

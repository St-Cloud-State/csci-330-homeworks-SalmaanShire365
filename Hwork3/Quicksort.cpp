#include <iostream>
#include <vector>
#include <utility>
#include <stack>

 int partition(std::vector<int>&arr, int low, int high) {
	// make a pivot variable placed at the end of the array
	int pivot = arr[high];
	// Trailing element before last element
	int i = (low - 1);

	// loop through low to last element
	for(int j = low; j < high; j++) {

		// if pivot is greater than the curr element
		if(arr[j] < pivot) {
		// swap arr[i] with arr[j] and increment the arr 
			i++;
			std::swap(arr[i],arr[j]);

		}
		}	
	// place pivot to position
	std::swap(arr[i+1],arr[high]);

	// return the point of partition
	return(i + 1);
	
 }


std::vector<int> quicksort(std::vector<int> &arr) {
	int size = arr.size();
	// sorted
	if(arr.empty()) return arr;
	// Maintain the stack to hold our sub arrays, identify that this stack holds a pair. 
	std::stack<std::pair<int,int>> stack;
	// pushes the entire array
	stack.push({0,size});


	
	// while the stack holds the subarrays
	while(!stack.empty())  {
		// unexamined ranges of subarrays  
 	 	std::pair<int,int> endpoints = stack.top();		stack.pop();
        // process the next subarray

		// start and end indices of the subarray
		int begin = endpoints.first;
		int end = endpoints.second;
		// base case
		if(begin < end) {	
			// array gets partitioned around pivot element
			int pi = partition(arr,begin,end);			
			std::cout << "One Pass: " << arr[pi] << std::endl;
			//Right sub-array
			if(pi + 1 <= end) stack.push({pi + 1,end});		
			//Left sub-arryy
			if(begin <= pi -1) stack.push({begin, pi - 1});
		}

	}
	return arr;
}
		

	
	int main() {
	
	//  instantiate unsorted vector
	std::vector<int> unsorted = {2,5,3,6,1,9};
	std::cout << "Unsorted: " << std::endl;
	for (int n : unsorted) {
		std::cout << n << " " << std::endl;
	}

	std::vector<int> sorted = quicksort(unsorted);
	std::cout << "After Sorting: " << std:: endl;

	for(int n : sorted) {
		std::cout << n << " " << std::endl;
	}


	
	return 0;	
 }

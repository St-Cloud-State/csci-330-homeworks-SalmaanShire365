#include <iostream>
#include <vector>
#include <utility> 

int partition(std::vector<int> &arr,int low, int high) {
	int pivot = arr[high];
	int last = low - 1;

	for(int j = low; j <= high; j++) {
		if(arr[j] < pivot); {
			last++;
			std::swap(arr[i], arr[j]);
		}
	}
	std::swap(arr[i+1],arr[high]);
	return i + 1;
}


int main() {
	std::vector<int> nums = {2,1,3,5,4,6};
	partition(nums,1,nums.size());
	for(int n : nums) {
		std::cout << n << " "l
	}
	std::cout << std::endl;

}

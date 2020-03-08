#include <vulkan/vulkan.hpp>
#include <GLFW/glfw3.h>
#include <vector>
#include <unordered_map>
#include <string>
#include <memory>
#include <algorithm>
#include <iostream>
#include <iomanip>

int main()
{
	glfwInit();
	atexit(glfwTerminate);

	// ================================================================
	// 1.1 Create instance
	// ================================================================

	const auto app_info = vk::ApplicationInfo(
		"Vulkan Application",
		VK_MAKE_VERSION(1, 0, 0),
		"Vulkan Engine",
		VK_MAKE_VERSION(1, 0, 0),
		VK_API_VERSION_1_1);

	std::uint32_t num_extentions;
	auto glfwExtensions = glfwGetRequiredInstanceExtensions(&num_extentions);

	std::vector<const char *const> extensions(glfwExtensions, glfwExtensions + num_extentions);
	std::vector<const char *const> layers = {"VK_LAYER_LUNARG_standard_validation"};

	auto instance = vk::createInstanceUnique(
		vk::InstanceCreateInfo()
			.setPApplicationInfo(&app_info)
			.setEnabledExtensionCount(extensions.size())
			.setPpEnabledExtensionNames(extensions.data())
			.setEnabledLayerCount(layers.size())
			.setPpEnabledLayerNames(layers.data()));

	// ================================================================
	// 1.2 Get phisical device
	// ================================================================

	auto devices = instance->enumeratePhysicalDevices();
	
	if (devices.empty())
	{
		std::cerr << "No available devices." << std::endl;
		std::exit(1);
	}

	std::unordered_map<vk::PhysicalDeviceType, std::string> device_types = {
		{vk::PhysicalDeviceType::eIntegratedGpu, "Integrated GPU"},
		{vk::PhysicalDeviceType::eDiscreteGpu, "Discrete GPU"},
		{vk::PhysicalDeviceType::eVirtualGpu, "Virtual GPU"},
		{vk::PhysicalDeviceType::eCpu, "CPU"},
		{vk::PhysicalDeviceType::eOther, "Other device"},
	};

	decltype(devices) availableDevices;

	std::cout << "Devices: " << std::endl;
	for (auto i = 0; i < devices.size(); ++i)
	{
		auto properties = devices[i].getProperties();
		std::cout << std::setw(2) << std::setfill('0') << i << ": ";
		std::cout << "Device name: " << properties.deviceName << std::endl;
		std::cout << "    Device type: " << device_types[properties.deviceType] << std::endl;
		std::cout << "    API version: "
				  << VK_VERSION_MAJOR(properties.apiVersion) << "."
				  << VK_VERSION_MINOR(properties.apiVersion) << "."
				  << VK_VERSION_PATCH(properties.apiVersion) << std::endl;
		std::cout << "    Driver version: "
				  << VK_VERSION_MAJOR(properties.driverVersion) << "."
				  << VK_VERSION_MINOR(properties.driverVersion) << "."
				  << VK_VERSION_PATCH(properties.driverVersion) << std::endl;
		std::cout << "    Vendor ID: " << properties.vendorID << std::endl;
		std::cout << "    Device ID: " << properties.deviceID << std::endl;
		std::cout << "    Available extensions: " << std::endl;
		auto extensionProperties = devices[i].enumerateDeviceExtensionProperties();
		for (auto j = 0; j < extensionProperties.size(); ++j)
		{
			std::cout << "    " << std::setw(2) << std::setfill('0') << j << ": ";
			std::cout << "Extention name: " << extensionProperties[j].extensionName << std::endl;
			std::cout << "        Specification version: " << extensionProperties[j].specVersion << std::endl;
		}
		std::cout << "    Available layers: " << std::endl;
		auto layerProperties = devices[i].enumerateDeviceLayerProperties();
		for (auto j = 0; j < layerProperties.size(); ++j)
		{
			std::cout << "    " << std::setw(2) << std::setfill('0') << j << ": ";
			std::cout << "Layer name: " << layerProperties[j].layerName << std::endl;
			std::cout << "        Specification version: " << layerProperties[j].specVersion << std::endl;
			std::cout << "        Implementation version: " << layerProperties[j].implementationVersion << std::endl;
			std::cout << "        Description: " << layerProperties[j].description << std::endl;
		}

		auto queueProperties = devices[i].getQueueFamilyProperties();
		if([&]()
		{
			for (auto j = 0; j < queueProperties.size(); ++j)
			{
				if (glfwGetPhysicalDevicePresentationSupport(*instance, devices[i], j))
					return true;
			}
			return false;
		}()){
			std::cout << "    This device supports presentation!" << std::endl;
			availableDevices.emplace_back(devices[i]);
		}else{
			std::cout << "    This device doesn't support presentation..." << std::endl;
		}
	}

	return 0;
}
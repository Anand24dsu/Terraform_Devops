import os

# Define the inventory file path
inventory_file = "inventory.ini"

# Function to update or add a node
def update_node_value(node_name, key, new_value):
    # Read the inventory file
    if os.path.exists(inventory_file):
        with open(inventory_file, "r") as file:
            lines = file.readlines()
    else:
        lines = []

    updated_lines = []
    node_found = False

    for line in lines:
        if line.strip().startswith(node_name):
            parts = line.split()
            for i, part in enumerate(parts):
                if part.startswith(f"{key}="):
                    parts[i] = f"{key}={new_value}"  # Update the value
            updated_lines.append(" ".join(parts) + "\n")
            node_found = True
        else:
            updated_lines.append(line)

    # If the node is not found, add it
    if not node_found:
        updated_lines.append(f"{node_name} {key}={new_value} ansible_user=packer\n")
        print(f"Node {node_name} not found. Adding it to the inventory.")

    # Write back the updated file
    with open(inventory_file, "w") as file:
        file.writelines(updated_lines)

# Get user input
node_to_update = input("Enter the node name (e.g., node1, node2, node3): ").strip()
key_to_update = input("Enter the key to update (e.g., ansible_host, cloud_location): ").strip()
new_value = input(f"Enter the new value for {key_to_update}: ").strip()

# Update or add the node
update_node_value(node_to_update, key_to_update, new_value)

print(f"Updated {node_to_update} {key_to_update} to {new_value} in {inventory_file}")

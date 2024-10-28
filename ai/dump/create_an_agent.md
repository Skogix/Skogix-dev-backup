To create an agent, follow these steps:

1. **Set Up Folder Structure**: Create a directory for your agent with the following structure:

    ```
    └── agents
        └── myagent
            ├── functions.json                  # JSON declarations for functions (Auto-generated)
            ├── index.yaml                      # Agent definition
            ├── tools.txt                       # Shared tools
            └── tools.{sh,js,py}                # Agent tools 
    ```

2. **Define the Agent**: Create an `index.yaml` file that defines your agent. This file should include:

    - **Name and Description**: Provide the agent's name and a brief description.
    - **Version**: Specify the version of your agent.
    - **Instructions**: Write instructions for using the agent.
    - **Variables**: Declare any variables that store information about a user's behavior or preferences.
    - **Documents**: List any documents used for Retrieval-Augmented Generation (RAG), which can be local files, directories, or remote URLs.

    Example of `index.yaml`:

    ```yaml
    name: MyAgent
    description: This is my custom AI agent
    version: 0.1.0
    instructions: You are a custom AI agent to assist with tasks.
    conversation_starters:
      - What can you do?
    variables:
      - name: foo
        description: This is a foo
    documents:
      - local-file.txt
      - local-dir/
      - https://example.com/remote-file.txt
    ```

3. **Implement Tools**: Write the tools in your preferred scripting language (Bash, JavaScript, or Python) within the `tools` directory. Each tool should be a script that performs a specific function.

4. **List Shared Tools**: In the `tools.txt` file, list any tools you wish to reuse from the shared `/tools` folder of your project.

5. **Build the Agent**: Use the provided tools to build the agent by generating `functions.json` and setting up any necessary links or installations.

This process allows you to create a customized agent that can perform specific functions and interact with users based on defined instructions and tools.

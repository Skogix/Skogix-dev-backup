# Skogix AI Manager System Dump

## Communication Protocols
- AI-to-AI Communication: Utilize YAML as the standard protocol for defining rules, configurations, and data exchange between AI agents.
- AI-to-Human Communication: Use Markdown for documentation, logs, and reports intended for human users.
- Ensure all communications are encrypted and authenticated.

## Security and Compliance
- The system will utilize Git for version control and management of all development activities.
- Implement comprehensive safety nets and access controls to ensure secure operations.

## User Interface
- The system will be entirely CLI-driven, with a strong focus on modularity.
- The design will enable users to "pipe" information between smaller commands, facilitating a flexible and efficient workflow.

## Architecture and Design
- The system will prioritize modularity, utilizing small containers that can spin up when needed and remain dormant otherwise.
- The preference is to use bash scripts for regular tools, with Python scripts for more complex tool execution.
- The design will focus on reproducibility, potentially using tools like Ansible, and adhere to the principle of "do one thing and do it well."
- Comprehensive documentation will be a key focus to ensure clarity and ease of use.

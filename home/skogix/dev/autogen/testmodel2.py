import logging
from autogen_agentchat import EVENT_LOGGER_NAME
from autogen_agentchat.agents import CodingAssistantAgent
from autogen_agentchat.logging import ConsoleLogHandler
from autogen_agentchat.messages import TextMessage
from autogen.models import OpenAIChatCompletionClient
from autogen_core.base import CancellationToken

# Set up logging
logger = logging.getLogger(EVENT_LOGGER_NAME)
logger.addHandler(ConsoleLogHandler())
logger.setLevel(logging.INFO)

# Create an OpenAI model client
model_client = OpenAIChatCompletionClient(
    model="gpt-4o-2024-08-06",
)

# Create a Coding Assistant Agent
agent = CodingAssistantAgent(
    model_client=model_client,
    name="CodingAssistant",
)

# Create a cancellation token
cancellation_token = CancellationToken()

# Send a message to the agent
message = TextMessage(content="Hello, can you help me with Python coding?")
response = agent.send_message(message, cancellation_token=cancellation_token)

# Print the response
print("Agent response:", response.content)

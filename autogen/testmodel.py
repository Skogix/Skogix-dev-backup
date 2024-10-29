import logging

from autogen_agentchat import EVENT_LOGGER_NAME
from autogen_agentchat.agents import CodingAssistantAgent, ToolUseAssistantAgent
from autogen_agentchat.logging import ConsoleLogHandler
from autogen_agentchat.messages import TextMessage
from autogen_agentchat.teams import MaxMessageTermination, RoundRobinGroupChat, SelectorGroupChat
from autogen_core.base import CancellationToken
from autogen_ext.models import OpenAIChatCompletionClient
from autogen_core.components.tools import FunctionTool

logger = logging.getLogger(EVENT_LOGGER_NAME)
logger.addHandler(ConsoleLogHandler())
logger.setLevel(logging.INFO)


# Create an OpenAI model client.
model_client = OpenAIChatCompletionClient(
    model="gpt-4o-2024-08-06",
)

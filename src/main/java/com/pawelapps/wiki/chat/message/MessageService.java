package com.pawelapps.wiki.chat.message;

import java.util.List;

public interface MessageService {

    List<MessageDto> getAllMessages();

    MessageDto saveMessage(MessageDto messageDto, String username);

    Message mapToMessage(MessageDto messageDto);

    MessageDto mapToDto(Message message);
}

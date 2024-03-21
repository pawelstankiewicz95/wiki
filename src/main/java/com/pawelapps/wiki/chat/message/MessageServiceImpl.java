package com.pawelapps.wiki.chat.message;

import com.pawelapps.wiki.user.User;
import com.pawelapps.wiki.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    private final UserService userService;
    private final MessageRepository messageRepository;

    @Autowired
    public MessageServiceImpl(UserService userService, MessageRepository messageRepository) {
        this.userService = userService;
        this.messageRepository = messageRepository;
    }

    @Override
    public List<MessageDto> getAllMessages() {
        return messageRepository.findAll().stream().map(message -> mapToDto(message)).toList();
    }

    @Override
    public MessageDto saveMessage(MessageDto messageDto, String username) {
        User user = userService.findByUsername(username);
        Message message = mapToMessage(messageDto);
        message.setUser(user);
        Message savedMessage = messageRepository.save(message);
        return mapToDto(savedMessage);
    }

    @Override
    public Message mapToMessage(MessageDto messageDto) {
        return Message.builder()
                .id(messageDto.id())
                .message(messageDto.message())
                .timeCreated(messageDto.timeCreated())
                .build();
    }

    @Override
    public MessageDto mapToDto(Message message) {
        return new MessageDto(
                message.getId(),
                message.getMessage(),
                message.getTimeCreated(),
                userService.mapToUserResponse(message.getUser()));
    }
}

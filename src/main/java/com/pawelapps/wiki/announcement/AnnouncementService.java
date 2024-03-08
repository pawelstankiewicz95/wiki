package com.pawelapps.wiki.announcement;

import java.util.List;

public interface AnnouncementService {
    List<AnnouncementResponse> findAll();
    AnnouncementResponse mapToAnnouncementResponse(Announcement announcement);
}

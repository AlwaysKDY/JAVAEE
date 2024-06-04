package com.example.jms;

import com.example.dao.CheckinService;
import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.MessageDriven;
import jakarta.inject.Inject;
import jakarta.jms.JMSException;
import jakarta.jms.MapMessage;
import jakarta.jms.Message;
import jakarta.jms.MessageListener;

@MessageDriven(name = "TicketMDB", activationConfig = {
        @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "jakarta.jms.Queue"),
        @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/queue/Queue")
})
public class TicketMDB implements MessageListener {

    @Inject
    private CheckinService checkinService;

    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof MapMessage) {
                MapMessage mapMessage = (MapMessage) message;
                int userId = mapMessage.getInt("userId");
                int attractionId = mapMessage.getInt("attractionId");

                boolean isValid = checkinService.validateAndCheckin(userId, attractionId);

                if (isValid) {
                    System.out.println("Checkin successful for userId: " + userId + " and attractionId: " + attractionId);
                } else {
                    System.out.println("Checkin failed for userId: " + userId + " and attractionId: " + attractionId);
                }
            }
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}

package com.example.jms;

import jakarta.jms.*;
import org.apache.activemq.ActiveMQConnectionFactory;
import java.util.Scanner;

public class TicketProducer {

    private static final String BROKER_URL = "tcp://localhost:61616"; // 修改端口为 61616
    private static final String QUEUE_NAME = "jms/queue/Queue";

    public static void main(String[] args) {
        ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory(BROKER_URL);
        Connection connection = null;
        Session session = null;

        try {
            connection = connectionFactory.createConnection();
            connection.start();
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

            Queue queue = session.createQueue(QUEUE_NAME);
            MessageProducer producer = session.createProducer(queue);

            Scanner scanner = new Scanner(System.in);

            while (true) {
                System.out.print("Enter User ID: ");
                int userId = scanner.nextInt();
                System.out.print("Enter Attraction ID (0 for main entrance): ");
                int attractionId = scanner.nextInt();

                // 创建 MapMessage
                MapMessage message = session.createMapMessage();
                message.setInt("userId", userId);
                message.setInt("attractionId", attractionId);

                // 发送消息
                producer.send(message);
                System.out.println("Message sent.");
            }
        } catch (Exception e) {
            System.err.println("Error in JMS Client: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (JMSException e) {
                    System.err.println("Error closing JMS session: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (JMSException e) {
                    System.err.println("Error closing JMS connection: " + e.getMessage());
                    e.printStackTrace();
                }
            }
        }
    }
}

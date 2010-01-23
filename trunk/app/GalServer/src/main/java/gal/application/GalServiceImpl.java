package gal.application;

//import java.util.Date;
//
//import flex.messaging.MessageBroker;
//import flex.messaging.messages.AsyncMessage;

import org.slf4j.Logger;

import gal.dto.TestDto;

public class GalServiceImpl implements GalService
{
	public Logger log;
	
	public Logger getLog()
	{
		return log;
	}

	public void setLog(Logger log)
	{
		this.log = log;
	}
	
	public void testCall(TestDto dto)
	{
		System.out.println("Text found: "+dto.getText());
		log.debug("Text found: "+dto.getText());
	}

//	private void sendMessage(Object message)
//	{
//		AsyncMessage msg = new AsyncMessage();
//
//		msg.setClientId("gal-client");
//		msg.setTimestamp(new Date().getTime());
//		//you can create a unique id
//		msg.setMessageId("Java-Based-Producer-For-Messaging-ID");
//		//destination to which the message is to be sent
//		msg.setDestination("galService");		
//		//set message body
//		msg.setBody(message);
//		//set message header
//		msg.setHeader("sender", "GAL server");
//
//		//send message to destination
//		MessageBroker.getMessageBroker(null).routeMessageToService(msg, null);			
//	}
}

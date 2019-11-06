package org.springblade.websocket;

import org.springblade.core.launch.BladeApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * WebSocketApplication
 *
 * @author Chill
 */
@SpringBootApplication
public class WebSocketApplication {

	public static void main(String[] args) {
		BladeApplication.run("blade-websocket", WebSocketApplication.class, args);
	}

}

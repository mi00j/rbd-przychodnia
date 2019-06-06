import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class Specjalizacja {
	
	public static Random rand = new Random();

	/**
	 * int id_lekarza = rand.nextInt(1000)+1;
	 * String imie = RandomStringUtils.randomAlphabetic(6);
	 * String nazwisko = RandomStringUtils.randomAlphabetic(8);
	 * int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
	 */
	public static String toJsonString() {
		int id_specjalizacji = rand.nextInt(5)+1;
		String nazwa = RandomStringUtils.randomAlphabetic(6);
		StringBuilder sb = new StringBuilder();
		sb.append("{\"id_specjalizacji\": ");
		sb.append(id_specjalizacji);
		sb.append(",\"nazwa\": \"");
		sb.append(nazwa);
		sb.append("\"}");
		return sb.toString();
	}
}

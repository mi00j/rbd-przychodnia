import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class Lekarz {
	
	public static Random rand = new Random();

	/**
	 * int id_lekarza = rand.nextInt(1000)+1;
	 * String imie = RandomStringUtils.randomAlphabetic(6);
	 * String nazwisko = RandomStringUtils.randomAlphabetic(8);
	 * int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
	 */
	public static String toJsonString() {
		StringBuilder sb = new StringBuilder();
		int id_lekarza = rand.nextInt(1000)+1;
		String imie = RandomStringUtils.randomAlphabetic(6);
		String nazwisko = RandomStringUtils.randomAlphabetic(8);
		int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
		sb.append("{\"id_lekarza\": ");
		sb.append(id_lekarza);
		sb.append(",\"imie\": \"");
		sb.append(imie);
		sb.append("\",\"nazwisko\": \"");
		sb.append(nazwisko);
		sb.append("\",\"data_podpisania_kontraktu\": ");
		sb.append(data_podpisania_kontraktu);
		sb.append(",\"specjalizacja\": ");
		sb.append(Specjalizacja.toJsonString());
		sb.append("}");
		return sb.toString();
	}
}

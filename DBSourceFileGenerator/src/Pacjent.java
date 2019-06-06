import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class Pacjent {
	
	public static Random rand = new Random();

	/**
	 * int id_lekarza = rand.nextInt(1000)+1;
	 * String imie = RandomStringUtils.randomAlphabetic(6);
	 * String nazwisko = RandomStringUtils.randomAlphabetic(8);
	 * int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
	 */
	public static String toJsonString() {
		StringBuilder sb = new StringBuilder();
		int id_pacjenta = rand.nextInt(1000)+1;
		String imie = RandomStringUtils.randomAlphabetic(6);
		String nazwisko = RandomStringUtils.randomAlphabetic(8);
		int wiek = rand.nextInt(74)+16;
		sb.append("{\"id_pacjenta\": ");
		sb.append(id_pacjenta);
		sb.append(",\"imie\": \"");
		sb.append(imie);
		sb.append("\",\"nazwisko\": \"");
		sb.append(nazwisko);
		sb.append("\", \"wiek\": ");
		sb.append(wiek);
		sb.append("}");
		return sb.toString();
	}
}

import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class Ocena {
	
	public static Random rand = new Random();

	/**
	 * int id_lekarza = rand.nextInt(1000)+1;
	 * String imie = RandomStringUtils.randomAlphabetic(6);
	 * String nazwisko = RandomStringUtils.randomAlphabetic(8);
	 * int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
	 */
	public static String toJsonString() {
		StringBuilder sb = new StringBuilder();
		int id_oceny = rand.nextInt(1000)+1;
		int wartosc = rand.nextInt(5)+1;
		String opis = RandomStringUtils.randomAlphabetic(10);
		sb.append("{\"id_oceny\": ");
		sb.append(id_oceny);
		sb.append(", \"wartosc\": ");
		sb.append(wartosc);
		sb.append(", \"opis\": \"");
		sb.append(opis);
		sb.append("\"}");
		return sb.toString();
	}
}

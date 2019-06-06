import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;

public class Wizyta {
	
	public static Random rand = new Random();
	
	public static int id_wizyty_inc = 0;
	/**
	 * int id_lekarza = rand.nextInt(1000)+1;
	 * String imie = RandomStringUtils.randomAlphabetic(6);
	 * String nazwisko = RandomStringUtils.randomAlphabetic(8);
	 * int data_podpisania_kontraktu = 1990 + rand.nextInt(28);
	 */
	public static String toJsonString() {
		StringBuilder sb = new StringBuilder();
		int id_wizyty = ++id_wizyty_inc;
		String data = RandomStringUtils.randomAlphabetic(8);
		int oplata = (rand.nextInt(6)+1)*50;
		int czas_trwania = rand.nextInt(75)+15;
		int numer_gabinetu = rand.nextInt(25)+1;
		sb.append("{\n\"id_wizyty\": ");
		sb.append(id_wizyty);
		sb.append(", \n\"data\": \"");
		sb.append(data);
		sb.append("\", \n\"oplata\": ");
		sb.append(oplata);
		sb.append(", \n\"czas_trwania\": ");
		sb.append(czas_trwania);
		sb.append(", \n\"numer_gabinetu\": ");
		sb.append(numer_gabinetu);
		sb.append(", \n\"lekarz\": ");
		sb.append(Lekarz.toJsonString());
		sb.append(", \n\"pacjent\": ");
		sb.append(Pacjent.toJsonString());
		sb.append(", \n\"ocena\": ");
		sb.append(Ocena.toJsonString());
		sb.append("\n}");
		
		return sb.toString();
	}
}

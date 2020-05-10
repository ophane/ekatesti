package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import model.Asiakas;
import model.dao.Dao;

class JUnitTestaaAsiakkaat {

	@Test
	public void testLisaaAsiakas() {
		
		Dao dao = new Dao();
		Asiakas asiakas_1 = new Asiakas("Raimo", "Myyrälä", "050-12345678", "raimo@mail.fi");
		Asiakas asiakas_2 = new Asiakas("Seppo", "Myyrälä", "050-24682468", "seppo@mail.fi");
		assertEquals(true, dao.lisaaAsiakas(asiakas_1));
		assertEquals(true, dao.lisaaAsiakas(asiakas_2));
	
	
	
	
	}
	@Test
	public void testMuutaAsiaks() {
		
		Dao dao = new Dao();
		Asiakas muutettava = dao.etsiAsiakas("5");
		muutettava.setEtunimi("Mikko");
		muutettava.setSukunimi("Mallikas");
		muutettava.setPuhelin("123-12345678");
		muutettava.setSposti("mikko@mallikas.fi");
		
		assertEquals("Mikko", dao.etsiAsiakas("5").getEtunimi());
		assertEquals("Mallikas", dao.etsiAsiakas("5").getSukunimi());
		assertEquals("123-12345678", dao.etsiAsiakas("5").getPuhelin());
		assertEquals("mikko@mallikas.fi", dao.etsiAsiakas("5").getSposti());
		
				
		
	}

	@Test
	
	public void testPoistaAsiakas() {
		Dao dao = new Dao();
		dao.poistaAsiakas("5");
		assertEquals(null, dao.etsiAsiakas("5"));
	}


}

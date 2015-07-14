using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;


namespace selenium_OB
{
    [TestClass]
    public class OEOM
    {
        IWebDriver driver = new ChromeDriver("C:/Users/Admin/Documents/ChromeDriver");

        [TestMethod]
        public void TC1_Login()
        {
            driver.Navigate().GoToUrl("https://gui-cp-qa.orchardbrands.biz:8080/webclient");
            driver.FindElement(By.CssSelector("FLD06053")).SendKeys("U92434CQ");
            driver.FindElement(By.Id("PASSWORD1")).SendKeys(("Suponc5") + (Keys.Enter));
        }
    }
}

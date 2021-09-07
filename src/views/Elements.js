/*!

=========================================================
* Paper Kit React - v1.3.0
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-kit-react

* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/paper-kit-react/blob/main/LICENSE.md)

* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

*/
import React from "react";

// reactstrap components

// core components
import IndexNavbar from "components/Navbars/IndexNavbar.js";
import IndexHeader from "components/Headers/IndexHeader.js";
import DemoFooter from "components/Footers/DemoFooter.js";

// index sections
import SectionButtons from "views/elements-sections/SectionButtons.js";
import SectionNavbars from "views/elements-sections/SectionNavbars.js";
import SectionNavigation from "views/elements-sections/SectionNavigation.js";
import SectionProgress from "views/elements-sections/SectionProgress.js";
import SectionNotifications from "views/elements-sections/SectionNotifications.js";
import SectionTypography from "views/elements-sections/SectionTypography.js";
import SectionJavaScript from "views/elements-sections/SectionJavaScript.js";
import SectionCarousel from "views/elements-sections/SectionCarousel.js";
import SectionNucleoIcons from "views/elements-sections/SectionNucleoIcons.js";
import SectionDark from "views/elements-sections/SectionDark.js";
import SectionLogin from "views/elements-sections/SectionLogin.js";
import SectionExamples from "views/elements-sections/SectionExamples.js";
import SectionDownload from "views/elements-sections/SectionDownload.js";

function Index() {
  document.documentElement.classList.remove("nav-open");
  React.useEffect(() => {
    document.body.classList.add("index");
    return function cleanup() {
      document.body.classList.remove("index");
    };
  });
  return (
    <>
      <IndexNavbar />
      <IndexHeader />
      <div className="main">
        <SectionButtons />
        <SectionNavbars />
        <SectionNavigation />
        <SectionProgress />
        <SectionNotifications />
        <SectionTypography />
        <SectionJavaScript />
        <SectionCarousel />
        <SectionNucleoIcons />
        <SectionDark />
        <SectionLogin />
        <SectionExamples />
        <SectionDownload />
        <DemoFooter />
      </div>
    </>
  );
}

export default Index;

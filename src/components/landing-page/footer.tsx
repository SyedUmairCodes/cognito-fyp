import React from "react";
import "../../app/globals.css";
const Footer = () => {
  return (
    <footer className="bg-background mt-4">
      <div className="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 lg:px-8">
        <div className="sm:flex sm:items-center sm:justify-between">
          <div className="flex justify-center text-teal-600 sm:justify-start">
            <h1 className="font-semibold dark:text-white text-2xl">Cognito</h1>
          </div>

          <p className="mt-4 text-center text-sm text-white lg:mt-0 lg:text-right">
            Copyright &copy; 2024. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;

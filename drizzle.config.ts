import type { Config } from "drizzle-kit";
import * as dotenv from "dotenv";

dotenv.config({ path: ".env" });

if (!process.env.DATABASE_URL) {
  console.log("Unable to find database url");
} else {
  console.log("Database url found, connected to Database.");
}

export default {
  dialect: "postgresql",
  schema: "./src/lib/supabase/schema.ts",
  out: "./migrations",
  dbCredentials: { url: process.env.DATABASE_URL || "" },
} satisfies Config;

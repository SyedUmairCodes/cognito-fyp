CREATE TABLE IF NOT EXISTS "workspaces" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"workspaceowner" uuid NOT NULL,
	"title" text NOT NULL,
	"iconid" text NOT NULL,
	"data" text,
	"intrash" text,
	"logo" text,
	"bannerurl" text
);

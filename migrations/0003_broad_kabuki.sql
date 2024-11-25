ALTER TABLE "collaborators" RENAME COLUMN "workspaceid" TO "workspace_id";--> statement-breakpoint
ALTER TABLE "collaborators" RENAME COLUMN "userid" TO "user_id";--> statement-breakpoint
ALTER TABLE "files" RENAME COLUMN "iconid" TO "icon_id";--> statement-breakpoint
ALTER TABLE "files" RENAME COLUMN "intrash" TO "in_trash";--> statement-breakpoint
ALTER TABLE "files" RENAME COLUMN "bannerurl" TO "banner_url";--> statement-breakpoint
ALTER TABLE "files" RENAME COLUMN "workspaceid" TO "workspace_id";--> statement-breakpoint
ALTER TABLE "folders" RENAME COLUMN "iconid" TO "icon_id";--> statement-breakpoint
ALTER TABLE "folders" RENAME COLUMN "intrash" TO "in_trash";--> statement-breakpoint
ALTER TABLE "folders" RENAME COLUMN "bannerurl" TO "banner_url";--> statement-breakpoint
ALTER TABLE "folders" RENAME COLUMN "workspaceid" TO "workspace_id";--> statement-breakpoint
ALTER TABLE "workspaces" RENAME COLUMN "workspaceowner" TO "workspace_owner";--> statement-breakpoint
ALTER TABLE "workspaces" RENAME COLUMN "iconid" TO "icon_id";--> statement-breakpoint
ALTER TABLE "workspaces" RENAME COLUMN "intrash" TO "in_trash";--> statement-breakpoint
ALTER TABLE "workspaces" RENAME COLUMN "bannerurl" TO "banner_url";--> statement-breakpoint
ALTER TABLE "collaborators" DROP CONSTRAINT "collaborators_workspaceid_workspaces_id_fk";
--> statement-breakpoint
ALTER TABLE "collaborators" DROP CONSTRAINT "collaborators_userid_users_id_fk";
--> statement-breakpoint
ALTER TABLE "files" DROP CONSTRAINT "files_workspaceid_workspaces_id_fk";
--> statement-breakpoint
ALTER TABLE "folders" DROP CONSTRAINT "folders_workspaceid_workspaces_id_fk";
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "collaborators" ADD CONSTRAINT "collaborators_workspace_id_workspaces_id_fk" FOREIGN KEY ("workspace_id") REFERENCES "public"."workspaces"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "collaborators" ADD CONSTRAINT "collaborators_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "files" ADD CONSTRAINT "files_workspace_id_workspaces_id_fk" FOREIGN KEY ("workspace_id") REFERENCES "public"."workspaces"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "folders" ADD CONSTRAINT "folders_workspace_id_workspaces_id_fk" FOREIGN KEY ("workspace_id") REFERENCES "public"."workspaces"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;

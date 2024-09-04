import { relations } from "drizzle-orm/relations";
import { workspaces, folders, files, usersInAuth, users, customers, products, prices, subscriptions } from "./schema";

export const foldersRelations = relations(folders, ({one, many}) => ({
	workspace: one(workspaces, {
		fields: [folders.workspaceId],
		references: [workspaces.id]
	}),
	files: many(files),
}));

export const workspacesRelations = relations(workspaces, ({many}) => ({
	folders: many(folders),
	files: many(files),
}));

export const filesRelations = relations(files, ({one}) => ({
	folder: one(folders, {
		fields: [files.folderId],
		references: [folders.id]
	}),
	workspace: one(workspaces, {
		fields: [files.workspaceId],
		references: [workspaces.id]
	}),
}));

export const usersRelations = relations(users, ({one, many}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [users.id],
		references: [usersInAuth.id]
	}),
	subscriptions: many(subscriptions),
}));

export const usersInAuthRelations = relations(usersInAuth, ({many}) => ({
	users: many(users),
	customers: many(customers),
	subscriptions: many(subscriptions),
}));

export const customersRelations = relations(customers, ({one}) => ({
	usersInAuth: one(usersInAuth, {
		fields: [customers.id],
		references: [usersInAuth.id]
	}),
}));

export const pricesRelations = relations(prices, ({one, many}) => ({
	product: one(products, {
		fields: [prices.productId],
		references: [products.id]
	}),
	subscriptions_priceId: many(subscriptions, {
		relationName: "subscriptions_priceId_prices_id"
	}),
	subscriptions_priceId: many(subscriptions, {
		relationName: "subscriptions_priceId_prices_id"
	}),
}));

export const productsRelations = relations(products, ({many}) => ({
	prices: many(prices),
}));

export const subscriptionsRelations = relations(subscriptions, ({one}) => ({
	price_priceId: one(prices, {
		fields: [subscriptions.priceId],
		references: [prices.id],
		relationName: "subscriptions_priceId_prices_id"
	}),
	price_priceId: one(prices, {
		fields: [subscriptions.priceId],
		references: [prices.id],
		relationName: "subscriptions_priceId_prices_id"
	}),
	usersInAuth: one(usersInAuth, {
		fields: [subscriptions.userId],
		references: [usersInAuth.id]
	}),
	user: one(users, {
		fields: [subscriptions.userId],
		references: [users.id]
	}),
}));